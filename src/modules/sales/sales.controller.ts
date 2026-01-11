import { Request, Response } from "express";
import { VentasService } from "./sales.service";



export const dashboardTopProducts = async (_req: Request, res: Response) => {
  try {
    const data = await VentasService.dashboardTopProducts();
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener dashboard de productos" });
  }
};

export const dashboardVentasPorDia = async (_req: Request, res: Response) => {
  try {
    const data = await VentasService.dashboardVentasPorDia();
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener ventas por día" });
  }
};


export const crearVenta = async (req: Request, res: Response) => {
  try {
    const { metodo_pago, detalles, cliente_id } = req.body;

    if (!metodo_pago || !detalles || detalles.length === 0 || !cliente_id) {
      return res.status(400).json({ message: "Datos incompletos" });
    }

    const usuario_id = (req as any).user.id;

    const result = await VentasService.crearVenta(
      usuario_id,
      cliente_id,
      metodo_pago,
      detalles
    );

    res.status(201).json(result);
  } catch (error: any) {
    console.error("ERROR CREAR VENTA:", error);
    res.status(400).json({ message: error.message });
  }
};

export const listarVentas = async (_: Request, res: Response) => {
  try {
    const ventas = await VentasService.listarVentas();
    res.json(ventas);
  } catch {
    res.status(500).json({ message: "Error al listar ventas" });
  }
};

export const detalleVenta = async (req: Request, res: Response) => {
  try {
    const ventaId = Number(req.params.id);
    const detalle = await VentasService.obtenerDetalle(ventaId);
    res.json(detalle);
  } catch {
    res.status(500).json({ message: "Error al obtener detalle" });
  }
};

export const anularVenta = async (req: Request, res: Response) => {
  try {
    const ventaId = Number(req.params.id);
    const result = await VentasService.anularVenta(ventaId);
    res.json(result);
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
};
