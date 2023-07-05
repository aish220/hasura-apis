import express, { Request, Response } from "express";

const calculatorRouter = express.Router();

calculatorRouter.post('/add', function (req: Request, res: Response) {
  const { numbers } = req.body.input;
  res.json({ sum: numbers.reduce((partialSum: number, a: number) => partialSum + a, 0) });
});

export default calculatorRouter;
