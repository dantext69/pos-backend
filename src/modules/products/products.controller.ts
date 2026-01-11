// src/modules/products/products.controller.ts
import { Request, Response } from "express";
import * as ProductService from "./products.service";

export const getAllProducts = async (_req: Request, res: Response) => {
  try {
    const products = await ProductService.getProducts();
    res.json(products);
  } catch (error) {
    res.status(500).json({ message: "Error al obtener productos", error });
  }
};

export const createProduct = async (req: Request, res: Response) => {
  try {
    const product = await ProductService.createProduct(req.body);
    res.status(201).json(product);
  } catch (error) {
    res.status(500).json({ message: "Error al crear producto", error });
  }
};

export const getProductById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);

    if (isNaN(id)) {
      return res.status(400).json({ message: "ID inválido" });
    }

    const product = await ProductService.getById(id);

    if (!product) {
      return res.status(404).json({ message: "Producto no encontrado" });
    }

    res.json(product);
  } catch (error) {
    res.status(500).json({ message: "Error al obtener producto" });
  }
};

export const updateProduct = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const product = await ProductService.updateProduct(id, req.body);
    res.json(product);
  } catch (error) {
    res.status(500).json({ message: "Error al actualizar producto", error });
  }
};

export const deleteProduct = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    await ProductService.deleteProduct(id);
    res.json({ message: "Producto eliminado" });
  } catch (error) {
    res.status(500).json({ message: "Error al eliminar producto", error });
  }
};
