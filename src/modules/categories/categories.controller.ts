import { Request, Response } from "express";
import * as CategoryService from "./categories.service";

// Obtener todas las categorías
export const getAllCategories = async (_req: Request, res: Response) => {
  try {
    const categories = await CategoryService.getCategories();
    res.json(categories);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener categorías", error });
  }
};

// Crear nueva categoría (solo nombre)
export const createCategory = async (req: Request, res: Response) => {
  try {
    const { nombre } = req.body;

    if (!nombre) {
      return res.status(400).json({ message: "Nombre es requerido" });
    }

    const category = await CategoryService.createCategory({ nombre });
    res.status(201).json(category);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al crear categoría", error });
  }
};

// Actualizar categoría
export const updateCategory = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { nombre, estado } = req.body;

    const category = await CategoryService.updateCategory(Number(id), {
      nombre,
      estado,
    });

    res.json(category);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al actualizar categoría", error });
  }
};

// Eliminar categoría
export const deleteCategory = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await CategoryService.deleteCategory(Number(id));
    res.json({ message: "Categoría eliminada" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al eliminar categoría", error });
  }
};
