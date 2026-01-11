import PDFDocument from "pdfkit";
import { pool } from "../../config/database";

export const generarFacturaPDF = async (ventaId: number): Promise<Buffer> => {
  console.log("🔥 GENERAR FACTURA EJECUTADO");
  const [ventas]: any = await pool.query(
    `
    SELECT v.id, v.total, v.creado_en,
           c.nombre, c.documento, c.direccion
    FROM ventas v
    JOIN clientes c ON c.id = v.cliente_id
    WHERE v.id = ?
    `,
    [ventaId]
  );

  if (ventas.length === 0) {
    throw new Error("Venta no encontrada");
  }

  const [detalles]: any = await pool.query(
    `
    SELECT p.nombre, vd.cantidad, vd.precio_unitario, vd.subtotal
    FROM venta_detalle vd
    JOIN productos p ON p.id = vd.producto_id
    WHERE vd.venta_id = ?
    `,
    [ventaId]
  );

  const doc = new PDFDocument({ margin: 50 });
  const buffers: Buffer[] = [];

  doc.on("data", buffers.push.bind(buffers));
  doc.on("end", () => {});

  doc.fontSize(16).text("FACTURA DE VENTA", { align: "center" });
  doc.moveDown();

  doc.fontSize(10).text(`Factura #: ${ventaId}`);
  doc.text(`Fecha: ${ventas[0].creado_en}`);
  doc.moveDown();

  doc.text(`Cliente: ${ventas[0].nombre}`);
  doc.text(`Documento: ${ventas[0].documento}`);
  doc.text(`Dirección: ${ventas[0].direccion}`);
  doc.moveDown();

  detalles.forEach((d: any) => {
    doc.text(
      `${d.nombre} | ${d.cantidad} x ${d.precio_unitario} = ${d.subtotal}`
    );
  });

  doc.moveDown();
  doc.fontSize(12).text(`TOTAL: $${ventas[0].total}`, { align: "right" });

  doc.end();

  return Buffer.concat(buffers);
};
