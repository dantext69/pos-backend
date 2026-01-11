import { Request, Response } from "express";
import PDFDocument from "pdfkit";
import {pool} from "../../config/database";

export const generarFactura = async (req: Request, res: Response) => {
  const { ventaId } = req.params;

  console.log("🔥 Generando factura venta:", ventaId);

  const [[venta]]: any = await pool.query(
    `SELECT v.*, c.nombre, c.cc
     FROM ventas v
     JOIN clientes c ON c.id = v.cliente_id
     WHERE v.id = ?`,
    [ventaId]
  );

  if (!venta) {
    return res.status(404).json({ message: "Venta no encontrada" });
  }

  const [detalles]: any = await pool.query(
    `SELECT d.cantidad, d.precio_unitario, p.nombre
     FROM venta_detalle d
     JOIN productos p ON p.id = d.producto_id
     WHERE d.venta_id = ?`,
    [ventaId]
  );

  const doc = new PDFDocument({ margin: 40 });

  res.setHeader("Content-Type", "application/pdf");
  res.setHeader(
    "Content-Disposition",
    `inline; filename=factura-${ventaId}.pdf`
  );

  doc.pipe(res);

  doc.fontSize(16).text("FACTURA DE VENTA", { align: "center" });
  doc.moveDown();

  doc.fontSize(10);
  doc.text("Empresa XYZ S.A.S");
  doc.text("NIT: 900123456-7");
  doc.text("Régimen: Responsable de IVA");
  doc.moveDown();

  doc.text(`Factura No: ${ventaId}`);
  doc.text(`Cliente: ${venta.nombre}`);
  doc.text(`Documento: ${venta.cc}`);
  doc.text(`Fecha: ${new Date().toLocaleDateString("es-CO")}`);
  doc.moveDown();

  doc.text("DETALLE:");
  doc.moveDown(0.5);

  detalles.forEach((d: any) => {
    doc.text(
      `${d.nombre} - ${d.cantidad} x $${d.precio_unitario} = $${d.cantidad * d.precio_unitario}`
    );
  });

  doc.moveDown();
  doc.fontSize(12).text(`TOTAL: $${venta.total}`, { align: "right" });

  doc.end();
};
