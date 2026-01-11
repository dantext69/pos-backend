import { Router } from "express";
import {
  crearVenta,
  listarVentas,
  detalleVenta,
  anularVenta, 
   dashboardTopProducts,
  dashboardVentasPorDia
} from "./sales.controller";
import { authMiddleware } from "../../middlewares/auth.middleware";
const router = Router();

// ⚠️ authMiddleware se agregará después
router.post("/",authMiddleware, crearVenta);
router.get("/",authMiddleware, listarVentas);
router.get("/:id/detalle",authMiddleware, detalleVenta);
router.patch("/:id/anular",authMiddleware, anularVenta);


// Rutas de dashboard
router.get("/dashboard/top-productos", authMiddleware, dashboardTopProducts);
router.get("/dashboard/ventas-dia", authMiddleware, dashboardVentasPorDia);

export default router;
