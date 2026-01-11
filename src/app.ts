import express from "express";
import cors from "cors";
import routes from "./routes";
import dotenv from "dotenv";
import facturaRoutes from "./modules/facturas/factura.routes";

const app = express();
dotenv.config();

app.use(cors());
app.use(express.json());

app.use("/api", routes);
app.use("/api/facturas", facturaRoutes);



export default app;



