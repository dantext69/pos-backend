import { Request, Response } from "express";
import * as ClienteService from "./clientes.service";

export const listarClientes = async (_req: Request, res: Response) => {
  try {
    const clientes = await ClienteService.getClientes();
    res.json(clientes);
  } catch {
    res.status(500).json({ message: "Error al listar clientes" });
  }
};

export const buscarPorDocumento = async (req: Request, res: Response) => {
  try {
    const { documento } = req.params;

    const cliente = await ClienteService.getClienteByDocumento(documento);

    if (!cliente) {
      return res.status(404).json({ message: "Cliente no encontrado" });
    }

    res.json(cliente);
  } catch {
    res.status(500).json({ message: "Error al buscar cliente" });
  }
};

export const crearCliente = async (req: Request, res: Response) => {
  try {
    const { nombre, cc, telefono, email, direccion } = req.body;

    if (!nombre || !cc || !telefono || !email || !direccion) {
      return res.status(400).json({ message: "Datos incompletos" });
    }

    const existente = await ClienteService.getClienteByDocumento(cc);
    if (existente) {
      return res.status(400).json({ message: "Cliente ya existe" });
    }

    const cliente = await ClienteService.createCliente({
      nombre,      // ✅
      cc,          // ✅
      telefono,
      email,
      direccion
    });

    res.status(201).json(cliente);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al crear cliente" });
  }
};

