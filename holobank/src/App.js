import React, { useState, useEffect } from "react";
import "./App.css";
import "./style.css";
import "tailwindcss/lib/css/preflight.css";
import HasuraHeader from "./components/hasura/HasuraHeader";
import HasuraLoyaltyHeader from "./components/hasura/HasuraLoyaltyHeader";
import HasuraFeaturesAndTestimonials from "./components/hasura/HasuraFeaturesAndTestimonials";
import HasuraContactUs from "./components/hasura/HasuraContactUs"
import Footer from "./components/hasura/HasuraFiveColumn";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import {
  ApolloClient,
  ApolloProvider,
  InMemoryCache,
  split,
  HttpLink,
  useQuery,
  useSubscription,
} from "@apollo/client";
import { getMainDefinition } from "@apollo/client/utilities";
import HasuraFullWidthWithImage from "./components/hasura/HasuraFullWidthWithImage";
import HasuraTabCardGrid from "./components/hasura/HasuraTabCardGrid";
import HasuraNewsCardGrid from "./components/hasura/HasuraNewsCardGrid";
import HasuraLoyaltyHero from "./components/hasura/HasuraLoyaltyHero";
import HasuraVerticalWithAlternateImageAndText from "./components/hasura/HasuraVerticalWithAlternateImageAndText";
import HasuraPopularAndRecentBlogPosts from "./components/hasura/HasuraPopularAndRecentBlogPosts";
import HasuraThreeColSimple from "./components/hasura/HasuraThreeColSimple";
import HasuraTransactions from "./components/hasura/HasuraTransactions";
import HasuraTransactionsAccountsNew from "./components/hasura/HasuraTransactionsAccountsNew";
import HasuraPointsBalance from "./components/hasura/HasuraPointsBalance";
import { WebSocketLink } from "@apollo/client/link/ws";
import HasuraGetStarted from "./components/hasura/HasuraGetStarted";

const {
  GET_NAME,
  GET_TRANSACTIONS_BEFORE,
  GET_TRANSACTIONS_AFTER,
  SUB_POINTS,
  GET_TRAVEL,
  GET_FOOD,
  GET_EXPERIENCES,
  GET_HOMEWARES,
  SNOWFLAKE_USER_INTERACTIONS,
} = require("./queries.js");

function App() {
  const [numberInput, setNumberInput] = useState(3);
  const [token, setToken] = useState(null);

  useEffect(() => {
    async function fetchToken() {
      try {
        const requestOptions = {
          headers: {
            "X-Hasura-User-Id": numberInput,
          },
        };
        const response = await fetch(
          process.env.REACT_APP_JWT_ENDPOINT,
          requestOptions
        );
        const token = await response.text();
        setToken(token);
      } catch (error) {
        console.error("Failed to fetch token", error);
      }
    }

    fetchToken();
  }, [numberInput]);

  if (
    !token
  ) {
    return (
      <div>
        <h2>Waiting for token</h2>
      </div>
    );
  }

  let headers = {
    Authorization: `Bearer ${token}`,
    // 'x-hasura-admin-secret': process.env.REACT_APP_HASURA_API_ADMIN_SECRET,
    // 'x-hasura-role': 'user',
    // 'x-hasura-user-id': String(numberInput),
    // 'x-hasura-admin-secret': process.env.REACT_APP_HASURA_API_ADMIN_SECRET,
  };

  let secure = '';
  if (process.env.NODE_ENV == 'production') {
    secure = 's';
  }
  const httpLink = new HttpLink({
    uri: `http${secure}://${process.env.REACT_APP_HASURA_API_URL}`,
    headers: headers,
  });

  const wsLink = new WebSocketLink({
    uri: `ws${secure}://${process.env.REACT_APP_HASURA_API_URL}`,
    options: {
      reconnect: true,
      lazy: true,
      connectionParams: { headers },
    },
  });

  const splitLink = split(
    ({ query }) => {
      const definition = getMainDefinition(query);
      return (
        definition.kind === "OperationDefinition" &&
        definition.operation === "subscription"
      );
    },
    wsLink,
    httpLink
  );

  const client = new ApolloClient({
    link: splitLink,
    cache: new InMemoryCache(),
  });

  const handleInputChange = (e) => {
    const value = e.target.value.trim();
    if (/^\d+$/.test(value)) {
      setNumberInput(parseInt(value, 10));
    }
  };

  if (
    !process.env.REACT_APP_HASURA_API_URL ||
    !process.env.REACT_APP_HASURA_API_ADMIN_SECRET
  ) {
    return (
      <div>
        <h2>Configuration Required</h2>
        <ol>
          <li>
            Locate the file example.env in the root directory of this project.
            <br />
          </li>
          <li>
            Make a copy of example.env and name it .env. You can use the command
            cp example.env .env to do this in a terminal or command prompt.
            <br />
          </li>
          <li>
            Open the .env file in your text editor of choice.
            <br />
          </li>
          <li>
            Find the lines that set the REACT_APP_HASURA_API_URL and
            REACT_APP_HASURA_API_ADMIN_SECRET variables. DO NOT use an https://
            prefix.
            <br />
          </li>
          <li>
            Replace the values on those lines with the appropriate values for
            your environment. For example, if your Hasura API endpoint is
            https://my-hasura-api.com, you would replace
            REACT_APP_HASURA_API_URL=[your-api-url-here] with
            REACT_APP_HASURA_API_URL=my-hasura-api.com.
            <br />
          </li>
          <li>
            Save the changes to the .env file.
            <br />
          </li>
          <li>
            Restart this React app
            <br />
          </li>
        </ol>
      </div>
    );
  }

  return (
    // <AnimationRevealPage>
    <ApolloProvider client={client}>
      <div className="App">
        <Router>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route
              path="/accounts"
              element={
                <Accounts
                  numberInput={numberInput}
                  handleInputChange={handleInputChange}
                />
              }
            />
            <Route
              path="/accounts-new"
              element={
                <AccountsAfter
                  numberInput={numberInput}
                  handleInputChange={handleInputChange}
                />
              }
            />
            <Route
              path="/loyalty"
              element={
                <Loyalty
                  numberInput={numberInput}
                  handleInputChange={handleInputChange}
                />
              }
            />
            <Route
              path="/news"
              element={
                <News
                  numberInput={numberInput}
                  handleInputChange={handleInputChange}
                />
              }
            />
            <Route
              path="/home-loans"
              element={
                <HomeLoans token={token}/>
              }
            />
          </Routes>
        </Router>
        <Footer></Footer>
        <h1>Footer</h1>
      </div>
    </ApolloProvider>
    // </AnimationRevealPage>
  );
}

function Home() {
  return (
    <>
      <HasuraFullWidthWithImage></HasuraFullWidthWithImage>
      <HasuraThreeColSimple></HasuraThreeColSimple>
      <HasuraPopularAndRecentBlogPosts></HasuraPopularAndRecentBlogPosts>
    </>
  );
}

function HomeLoans({ token }) {
  return (
    <>
    <HasuraFeaturesAndTestimonials></HasuraFeaturesAndTestimonials>
    <HasuraGetStarted></HasuraGetStarted>
    <HasuraContactUs token={token}></HasuraContactUs>
    </>
  );
}

function Loyalty({ numberInput, handleInputChange }) {
  const [points, setPoints] = useState("");
  const [name, setName] = useState("");
  const [travel, setTravel] = useState("");
  const [food, setFood] = useState("");
  const [experiences, setExperiences] = useState("");
  const [homewares, setHomewares] = useState("");

  const { loading: pointsLoading, error: pointsError, data: pointsResult } = useSubscription(SUB_POINTS, {});
  const { loading: namesLoading, error: namesError, data: namesResult } = useQuery(GET_NAME, {});
  const { loading: travelLoading, error: travelError, data: travelResult } = useSubscription(GET_TRAVEL, {});
  const { loading: foodLoading, error: foodError, data: foodResult } = useSubscription(GET_FOOD, {});
  const { loading: experiencesLoading, error: experiencesError, data: experiencesResult } = useSubscription(GET_EXPERIENCES, {});
  const { loading: homewaresLoading, error: homewaresError, data: homewaresResult } = useSubscription(GET_HOMEWARES, {});


  useEffect(() => {
    if (namesResult?.users) {
      setName(namesResult.users[0].name);
    }
  }, [namesResult]);

  useEffect(() => {
    if (pointsResult?.points) {
      setPoints(pointsResult.points[0].points_balance)
    }
  }, [pointsResult]);

  useEffect(() => {
    if (travelResult?.points_catalogue) {
      const travelObj = travelResult.points_catalogue.map((item) => ({
        imageSrc: item.image,
        title: item.destination,
        content: item.description,
        price: item.cost.toLocaleString(undefined, {maximumFractionDigits: 0, minimumFractionDigits: 0}),
        rating: item.rating.toLocaleString(undefined, {maximumFractionDigits: 1, minimumFractionDigits: 1}),
        reviews: item.reviewers,
        url: '#',
        points_club: item.points_club
      }));

      setTravel(travelObj)
    }
  }, [travelResult]);

  useEffect(() => {
    if (foodResult?.points_catalogue) {
      const foodObj = foodResult.points_catalogue.map((item) => ({
        imageSrc: item.image,
        title: item.destination,
        content: item.description,
        price: item.cost.toLocaleString(undefined, {maximumFractionDigits: 0, minimumFractionDigits: 0}),
        rating: item.rating.toLocaleString(undefined, {maximumFractionDigits: 1, minimumFractionDigits: 1}),
        reviews: item.reviewers,
        url: '#',
        points_club: item.points_club
      }));

      setFood(foodObj)
    }
  }, [foodResult]);

  useEffect(() => {
    if (experiencesResult?.points_catalogue) {
      const experiencesObj = experiencesResult.points_catalogue.map((item) => ({
        imageSrc: item.image,
        title: item.destination,
        content: item.description,
        price: item.cost.toLocaleString(undefined, {maximumFractionDigits: 0, minimumFractionDigits: 0}),
        rating: item.rating.toLocaleString(undefined, {maximumFractionDigits: 1, minimumFractionDigits: 1}),
        reviews: item.reviewers,
        url: '#',
        points_club: item.points_club
      }));

      setExperiences(experiencesObj)
    }
  }, [experiencesResult]);

  useEffect(() => {
    if (homewaresResult?.points_catalogue) {
      const homewaresObj = homewaresResult.points_catalogue.map((item) => ({
        imageSrc: item.image,
        title: item.destination,
        content: item.description,
        price: item.cost.toLocaleString(undefined, {maximumFractionDigits: 0, minimumFractionDigits: 0}),
        rating: item.rating.toLocaleString(undefined, {maximumFractionDigits: 1, minimumFractionDigits: 1}),
        reviews: item.reviewers,
        url: '#',
        points_club: item.points_club
      }));

      setHomewares(homewaresObj)
    }
  }, [homewaresResult]);

  if (namesLoading || pointsLoading ) return <p>Loading...</p>;
  if (namesError || pointsError || travelError || foodError || experiencesError || homewaresError) return <p>Waiting for user id</p>;

  return (
    <>
    <HasuraLoyaltyHeader
      numberInput={numberInput}
      handleInputChange={handleInputChange}
      name={name}
      setName={setName}
    ></HasuraLoyaltyHeader>
    <HasuraLoyaltyHero></HasuraLoyaltyHero>
    <HasuraPointsBalance
      points={points}
      setPoints={setPoints}
    ></HasuraPointsBalance>
    <HasuraTabCardGrid
      travel={travel}
      food={food}
      experiences={experiences}
      homewares={homewares}>
    </HasuraTabCardGrid>
    </>
  );
}

function News({ numberInput, handleInputChange }) {
  const [name, setName] = useState("");
  const [news, setNews] = useState("");

  const { loading: namesLoading, error: namesError, data: namesResult } = useQuery(GET_NAME, {});
  const { loading: newsLoading, error: newsError, data: newsResult } = useSubscription(GET_TRAVEL, {});

  useEffect(() => {
    if (namesResult?.users) {
      setName(namesResult.users[0].name);
    }
  }, [namesResult]);

  useEffect(() => {
    if (newsResult?.points_catalogue) {
      const newsObj = newsResult.points_catalogue.map((item) => ({
        imageSrc: item.image,
        title: item.destination,
        content: item.description,
        price: item.cost.toLocaleString(undefined, {maximumFractionDigits: 0, minimumFractionDigits: 0}),
        rating: item.rating.toLocaleString(undefined, {maximumFractionDigits: 1, minimumFractionDigits: 1}),
        reviews: item.reviewers,
        url: '#',
        points_club: item.points_club
      }));

      setNews(newsObj)
    }
  }, [newsResult]);

  if (namesLoading) return <p>Loading...</p>;
  if (namesError || newsError) return <p>Waiting for user id</p>;

  return (
    <>
    <HasuraLoyaltyHeader
      numberInput={numberInput}
      handleInputChange={handleInputChange}
      name={name}
      setName={setName}
    ></HasuraLoyaltyHeader>
    <HasuraLoyaltyHero></HasuraLoyaltyHero>
    <HasuraNewsCardGrid
      news={news}>
    </HasuraNewsCardGrid>
    </>
  );
}

function Accounts({ numberInput, handleInputChange }) {
  const [transactions, setTransactions] = useState([]);
  const [accounts, setAccounts] = useState([]);
  const [creditCards, setCreditCards] = useState([]);
  const [currentAccount, setCurrentAccount] = useState([]);
  const [userInteractions, setUserInteractions] = useState([]);

  const { loading, error, data } = useQuery(GET_TRANSACTIONS_BEFORE, {});
  // const { loading: snowflakeLoading, error: snowflakeError, data: snowflakeData } = useQuery(SNOWFLAKE_USER_INTERACTIONS, {});

  useEffect(() => {
    if (data?.accounts) {
      const accounts = data.accounts.map((item) => ({
        id: item.id,
        name: item.name,
        balance:
          (item.transactionsByAccountIdTo_aggregate.aggregate.sum.amount || 0) -
          (item.transactionsByAccountIdFrom_aggregate.aggregate.sum.amount ||
            0),
        transactionsFrom: item.transactionsByAccountIdFrom,
        transactionsTo: item.transactionsByAccountIdTo,
      }));

      const transactionsFrom = data.accounts.map((item) => {
        return item.transactionsByAccountIdFrom.map((item2) => ({
          accountId: item.id,
          id: item2.id,
          amount: item2.amount,
          description: item2.description,
          date: item2.created_at,
          from: item2.to,
          to: item.from,
          debit: item2.amount,
          receipt_id: item2.receipt_id,
          category_name: item2.transactionCategoryByTransactionCategory?.name,
          category_icon: item2.transactionCategoryByTransactionCategory?.icon,
        }));
      });

      const transactionsTo = data.accounts.map((item) => {
        return item.transactionsByAccountIdTo.map((item2) => ({
          accountId: item.id,
          id: item2.id,
          amount: item2.amount,
          description: item2.description,
          date: item2.created_at,
          credit: item2.amount,
          receipt_id: item2.receipt_id,
          category_name: item2.transactionCategoryByTransactionCategory?.name,
          category_icon: item2.transactionCategoryByTransactionCategory?.icon,
        }));
      });

      const creditCards = data?.credit_cards_public.map((card) => ({
        number_dec: card.number_dec,
        CVV: card.cvv,
        expiry: card.expiry,
        balance: card.balance
      }))

      const allTransactions = []
        .concat(...transactionsTo, ...transactionsFrom)
        .sort((a, b) => new Date(b.date) - new Date(a.date));

      setCreditCards(creditCards);
      setAccounts(accounts);
      setTransactions(allTransactions);
      setCurrentAccount(accounts[0]);
    }
  }, [data]);



  // useEffect(() => {
  //   if (snowflakeData?.OPERATIONAL_DATA) {
  //     let totals = {};
  //     for (const item of snowflakeData.OPERATIONAL_DATA) {
  //       const interactionType = item.CUSTOMER_SERVICE_INTERACTIONS;
  //       if (!totals.hasOwnProperty(interactionType)) {
  //         totals[interactionType] = 1;
  //       } else {
  //         totals[interactionType]++;
  //       }
  //     }
  //     setUserInteractions(totals);
  //   }
  // }, [snowflakeData]);



  if (loading) return <p>Loading...</p>;
  if (error) return <p>Waiting for user id</p>;

  return (
    <>
      <HasuraHeader
        numberInput={numberInput}
        handleInputChange={handleInputChange}
      ></HasuraHeader>
      <HasuraTransactions
        accounts={accounts}
        transactions={transactions}
        currentAccount={currentAccount}
        setCurrentAccount={setCurrentAccount}
        creditCards={creditCards}
        // userInteractions={userInteractions}
      ></HasuraTransactions>
    </>
  );
}

function AccountsAfter({ numberInput, handleInputChange }) {
  const [transactions, setTransactions] = useState([]);
  const [accounts, setAccounts] = useState([]);
  const [creditCards, setCreditCards] = useState([]);
  const [currentAccount, setCurrentAccount] = useState([]);
  const [userInteractions, setUserInteractions] = useState([]);

  const { loading, error, data } = useQuery(GET_TRANSACTIONS_AFTER, {});
  // const { loading: snowflakeLoading, error: snowflakeError, data: snowflakeData } = useQuery(SNOWFLAKE_USER_INTERACTIONS, {});

  useEffect(() => {
    if (data?.accounts) {
      const accounts = data.accounts.map((item) => ({
        id: item.id,
        name: item.name,
        balance:
          (item.transactionsByAccountIdTo_aggregate.aggregate.sum.amount || 0) -
          (item.transactionsByAccountIdFrom_aggregate.aggregate.sum.amount ||
            0),
        transactionsFrom: item.transactionsByAccountIdFrom,
        transactionsTo: item.transactionsByAccountIdTo,
      }));

      const transactionsFrom = data.accounts.map((item) => {
        return item.transactionsByAccountIdFrom.map((item2) => ({
          accountId: item.id,
          id: item2.id,
          amount: item2.amount,
          description: item2.description,
          date: item2.created_at,
          from: item2.to,
          to: item.from,
          debit: item2.amount,
          receipt_id: item2.receipt_id,
          category_name: item2.transactionCategoryByTransactionCategory?.name,
          category_icon: item2.transactionCategoryByTransactionCategory?.icon,
        }));
      });

      const transactionsTo = data.accounts.map((item) => {
        return item.transactionsByAccountIdTo.map((item2) => ({
          accountId: item.id,
          id: item2.id,
          amount: item2.amount,
          description: item2.description,
          date: item2.created_at,
          credit: item2.amount,
          receipt_id: item2.receipt_id,
          category_name: item2.transactionCategoryByTransactionCategory?.name,
          category_icon: item2.transactionCategoryByTransactionCategory?.icon,
        }));
      });

      const creditCards = data?.credit_cards_public.map((card) => ({
        number_dec: card.number_dec,
        CVV: card.cvv,
        expiry: card.expiry,
        balance: card.balance
      }))

      const allTransactions = []
        .concat(...transactionsTo, ...transactionsFrom)
        .sort((a, b) => new Date(b.date) - new Date(a.date));

      setCreditCards(creditCards);
      setAccounts(accounts);
      setTransactions(allTransactions);
      setCurrentAccount(accounts[0]);
    }
  }, [data]);



  // useEffect(() => {
  //   if (snowflakeData?.OPERATIONAL_DATA) {
  //     let totals = {};
  //     for (const item of snowflakeData.OPERATIONAL_DATA) {
  //       const interactionType = item.CUSTOMER_SERVICE_INTERACTIONS;
  //       if (!totals.hasOwnProperty(interactionType)) {
  //         totals[interactionType] = 1;
  //       } else {
  //         totals[interactionType]++;
  //       }
  //     }
  //     setUserInteractions(totals);
  //   }
  // }, [snowflakeData]);



  if (loading) return <p>Loading...</p>;
  if (error) return <p>Waiting for user id</p>;

  return (
    <>
      <HasuraHeader
        numberInput={numberInput}
        handleInputChange={handleInputChange}
      ></HasuraHeader>
      <HasuraTransactionsAccountsNew
        accounts={accounts}
        transactions={transactions}
        currentAccount={currentAccount}
        setCurrentAccount={setCurrentAccount}
        creditCards={creditCards}
        // userInteractions={userInteractions}
      ></HasuraTransactionsAccountsNew>
    </>
  );
}

export default App;
