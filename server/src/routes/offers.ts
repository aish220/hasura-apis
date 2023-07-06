import express, { Request, Response } from "express";
import axios from "axios";
import { CustomerResponse } from "../types";

const offersRouter = express.Router();

// Request Handler
offersRouter.post("/", async (req, res) => {

  // run some business logic
  const { accountNumber } = req.body.input;

  // const variables = { code };

  try {
    const { data, status } = await axios.get<CustomerResponse>(
      `http://localhost:8080/api/rest/getCust?account=${accountNumber}`
    );
    const { customers_offers, acctBalance } = data.customers[0];
    const ttlDiscount = customers_offers
      .map((offer) => offer.discount)
      .reduce((ttlDis, dis) => ttlDis + dis, 0);

      console.log("API , total discount",ttlDiscount)

    res.json({ discount: ttlDiscount });
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.log("error message: ", error.message);
      // 👇️ error: AxiosError<any, any>
      return error.message;
    } else {
      console.log("unexpected error: ", error);
      return "An unexpected error occurred";
    }
  }
});

export default offersRouter;
