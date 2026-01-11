import { Router } from "express";
import authRoutes from "../modules/auth/auth.routes";
import categoriesRoutes from "../modules/categories/categories.routes";
import productsRoutes from "../modules/products/products.routes";
import ventasRoutes from "../modules/sales/sales.routes";
import facturasRotes from "../modules/facturas/factura.routes";
import clientesRotes from "../modules/clientes/clientes.routes";
const router = Router();

// Rutas de cada módulo
router.use("/auth", authRoutes);
router.use("/categories", categoriesRoutes);
router.use("/products", productsRoutes);
router.use("/ventas", ventasRoutes);
router.use("/factura", facturasRotes);
router.use("/clientes", clientesRotes);

// Ruta de salud
router.get("/health", (_, res) => {
  res.json({ ok: true });
});

export default router;
