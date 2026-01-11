// src/modules/categories/categories.routes.ts
import { Router } from "express";
import * as CategoryController from "./categories.controller";

const router = Router();

router.get("/", CategoryController.getAllCategories);
router.post("/", CategoryController.createCategory);
router.put("/:id", CategoryController.updateCategory);
router.delete("/:id", CategoryController.deleteCategory);

export default router;
