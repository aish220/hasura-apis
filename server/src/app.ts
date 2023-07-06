import express, { Express, Request, Response } from "express";
import cookieParser from "cookie-parser";
import logger from "morgan";
import bodyParser from "body-parser";

import calculatorRouter from "./routes/calculator";
import offersRouter from "./routes/offers";

const app: Express = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(bodyParser.json());

app.get('/', (req: Request, res: Response) => {
    res.send('Express + TypeScript Server');
});

app.use('/cal', calculatorRouter);
app.use('/offers', offersRouter);

export default app;
