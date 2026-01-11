import { Router } from "express";
import { generarFactura } from "./factura.controller";
//import { authMiddleware } from "../../middlewares/auth.middleware";

const router = Router();

router.get("/:ventaId/pdf",  generarFactura);



export default router;
