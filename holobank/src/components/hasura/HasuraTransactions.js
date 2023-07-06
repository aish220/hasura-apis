import React, { useState } from "react";
import { PieChart, Pie, Cell, Label, Line, Tooltip } from 'recharts';
import { motion } from "framer-motion";
import tw from "twin.macro";
import styled from "styled-components";
import { css } from "styled-components/macro"; //eslint-disable-line
import {
  SectionHeading,
  Subheading as SubheadingBase,
} from "../../components/misc/Headings.js";
import { ReactComponent as PlusIcon } from "feather-icons/dist/icons/plus.svg";
import { ReactComponent as MinusIcon } from "feather-icons/dist/icons/minus.svg";

const Container = tw.div`relative`;
const Content = tw.div`max-w-screen-xl mx-auto py-16 lg:py-20`;

const TwoColumn = tw.div`flex`;
const Column = tw.div``;

const TransactionsTable = tw.table`w-full border-collapse overflow-hidden bg-white`;

const FAQContent = tw.div`lg:ml-12`;
const Subheading = tw(SubheadingBase)`mb-4 text-center lg:text-left`;
const Heading = tw(SectionHeading)`lg:text-left`;
const Description = tw.p`max-w-xl text-center mx-auto lg:mx-0 lg:text-left lg:max-w-none leading-relaxed text-sm sm:text-base lg:text-base font-medium mt-4 text-secondary-100`;

const Question = tw.tr`justify-between items-center text-xl`;

const QuestionToggleIcon = styled.span`
  ${tw`ml-2 bg-primary-500 text-gray-100 p-1 rounded-full group-hover:bg-primary-700 group-hover:text-gray-200 transition duration-300`}
  svg {
    ${tw`w-4 h-4`}
  }
`;

const Link = tw.a`w-full sm:w-auto text-sm sm:text-base rounded font-bold border border-transparent tracking-wide transition duration-300 focus:outline-none focus:shadow-outline`;

const PrimaryLink = tw(
  Link
)`shadow text-gray-100 hocus:text-gray-300 bg-primary-500 hocus:bg-primary-700 flex flex-col space-y-40 py-4`;

const SecondaryLink = tw.a`text-primary-500 hover:text-primary-600 bg-gray-100 hover:bg-gray-200 flex flex-col space-y-40 py-4`;
const TransactionColumn = tw.td`text-right mt-4 max-w-xs font-medium text-sm mx-auto md:mx-0 md:mr-4`;

const formatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",

  minimumFractionDigits: 2, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
  maximumFractionDigits: 2, // (causes 2500.99 to be printed as $2,501)
});

export default ({
  subheading = "",
  heading = "Transactions",
  description = "View all of your transactions below click to view more details.",
  accounts,
  transactions,
  currentAccount,
  setCurrentAccount,
  creditCards,
  userInteractions
}) => {
  const [activeQuestionIndex, setActiveQuestionIndex] = useState(null);
  const [showCards, setShowCards] = useState(false);

  const toggleQuestion = (questionIndex) => {
    if (activeQuestionIndex === questionIndex) setActiveQuestionIndex(null);
    else setActiveQuestionIndex(questionIndex);
  };

  const filteredTransactions = transactions.filter(
    (transaction) => transaction.accountId === currentAccount?.id
  );

  const [expandedTransactions, setExpandedTransactions] = useState([]);

  const toggleTransaction = (id) => {
    if (expandedTransactions.includes(id)) {
      setExpandedTransactions(expandedTransactions.filter((tid) => tid !== id));
    } else {
      setExpandedTransactions([...expandedTransactions, id]);
    }
  };

  // const pieChartData = Object.entries(userInteractions).map(([name, value]) => ({
  //   name,
  //   value,
  // }));

  // const colors = [
  //   "#9e47ff",
  //   "#a86bff",
  //   "#b27eff",
  //   "#ba91ff",
  //   "#c3a3ff",
  //   "#ccafff",
  //   "#d5beff",
  //   "#decfff",
  //   "#e8dfff",
  //   "#f1eeff"
  // ];

  // const renderCustomizedLabel = ({ cx, cy, midAngle, innerRadius, outerRadius, percent, index, name }) => {
  //   const RADIAN = Math.PI / 180;
  //   const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
  //   const x = cx + radius * Math.cos(-midAngle * RADIAN);
  //   const y = cy + radius * Math.sin(-midAngle * RADIAN);

  //   return (
  //     <text x={x} y={y} fill="black" textAnchor="middle" dominantBaseline="central">
  //       {`${name} ${(percent * 100).toFixed(0)}%`}
  //     </text>
  //   );
  // };

  return (
    <Container>
      <Content>
        <TwoColumn>
          <Column tw="hidden lg:block w-5/12 flex-shrink-0">
            <section className="accounts">
              <Heading>Accounts</Heading>
              {accounts.map((account) => (
                <div
                  key={account.id}
                  className={account === currentAccount ? "active-account" : ""}
                  onClick={() => setCurrentAccount(account)}
                >
                  {account === currentAccount ? (
                    <PrimaryLink href="#">
                      {account?.name}: {formatter.format(account.balance)}
                    </PrimaryLink>
                  ) : (
                    <SecondaryLink href="#">
                      {account?.name}: {formatter.format(account.balance)}
                    </SecondaryLink>
                  )}
                </div>
              ))}
            </section>
            <section className="credit-cards" tw="mb-20">
              <Heading>Credit cards</Heading>
              <table>
                <tbody>
                  <Question
                    className="cursor-pointer"
                    onClick={() => setShowCards(!showCards)}
                  >
                    <td tw="text-left px-4">View cards</td>
                    <td tw="text-right">
                      {/* {formatter.format(
                    creditCards.reduce((total, card) => total + card.balance, 0)
                  )} */}
                    </td>
                    <td></td>
                    <td tw="flex text-right border-transparent items-center h-10">
                      <QuestionToggleIcon>
                        {showCards ? (
                          <MinusIcon aria-hidden="true" />
                        ) : (
                          <PlusIcon aria-hidden="true" />
                        )}
                      </QuestionToggleIcon>
                    </td>
                  </Question>
                </tbody>
              </table>
              <table>
                {showCards && (
                  <tbody>
                    {creditCards.map((card, index) => (
                      <React.Fragment key={card.CVV}>
                        <Question
                          className={`${index % 2 === 0 ? "bg-gray-100" : "bg-white"
                            }`}
                        >
                          <TransactionColumn tw="text-left py-4 px-4">
                            {card.number_dec}
                          </TransactionColumn>
                          <TransactionColumn tw="text-right py-4 text-base font-semibold px-4">
                            {formatter.format(card.balance)}
                          </TransactionColumn>
                          <TransactionColumn></TransactionColumn>
                          <TransactionColumn></TransactionColumn>
                        </Question>
                      </React.Fragment>
                    ))}
                  </tbody>
                )}
              </table>
            </section>
            {/* <section className="branch-interaction">
              <Heading>Branch Interactions</Heading>
              <PieChart width={500} height={500}>
                <Pie
                  data={pieChartData}
                  cx={200}
                  cy={200}
                  labelLine={false}
                  label={renderCustomizedLabel}
                  innerRadius={60}
                  outerRadius={180}
                  fill="#8884d8"
                  dataKey="value"
                >
                  {pieChartData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={colors[index % colors.length]} />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </section> */}
          </Column>
          <Column tw="flex-grow">
            <section className="transactions">
              <FAQContent tw="justify-between">
                {subheading ? <Subheading>{subheading}</Subheading> : null}
                <Heading>{heading}</Heading>
                <Description>{description}</Description>
                <TransactionsTable>
                  <thead>
                    <Question tw="text-primary-500 font-bold">
                      <td tw="text-left">Description</td>
                      <td tw="text-right">Debit</td>
                      <td tw="text-right">Credit</td>
                    </Question>
                  </thead>

                  <tbody>
                    {filteredTransactions.map((transaction, index) => (
                      <React.Fragment key={transaction.id}>
                        <Question
                          tw="first:border-t-0 border-y border-gray-300 hocus:border-primary-500 hocus:text-primary-500 hocus:bg-gray-100 hover:font-bold font-medium"
                          onClick={() => toggleTransaction(transaction.id)}
                        >
                          <TransactionColumn tw="text-left py-4 text-base font-semibold">
                            {transaction.description}
                          </TransactionColumn>
                          <TransactionColumn>
                            {transaction.debit
                              ? formatter.format(transaction.debit)
                              : ""}
                          </TransactionColumn>
                          <TransactionColumn>
                            {transaction.credit
                              ? formatter.format(transaction.credit)
                              : ""}
                          </TransactionColumn>
                          <td tw="flex text-right border-transparent h-16 items-center">
                            <QuestionToggleIcon>
                              {expandedTransactions.includes(transaction.id) ? (
                                <MinusIcon />
                              ) : (
                                <PlusIcon />
                              )}
                            </QuestionToggleIcon>
                          </td>
                        </Question>
                        {expandedTransactions.includes(transaction.id) && (
                          <tr tw="text-left">
                            <td colSpan="4">
                              <ul tw="mt-4 mb-4 ml-4 flex justify-between">
                                <ul tw="mb-2">
                                  <li>
                                    <span tw="text-primary-500">On:</span>{" "}
                                    <span tw="text-gray-700">
                                      {new Date(
                                        transaction.date
                                      ).toLocaleString()}
                                    </span>
                                  </li>
                                  <li>
                                    <span tw="text-primary-500">Receipt ID:</span>{" "}
                                    <span tw="text-gray-700">
                                      {transaction.receipt_id}
                                    </span>
                                  </li>
                                </ul>
                                <li tw="justify-end pr-4">
                                  <span tw="inline-flex items-center px-4 py-1 rounded-full bg-primary-500 justify-center">
                                    <span
                                      tw="inline-block h-4 w-4 mr-4 mb-2 text-white"
                                      id="category-icon-{transaction.id}"
                                      dangerouslySetInnerHTML={{
                                        __html: transaction.category_icon,
                                      }}
                                      onLoad={() => {
                                        const iconElement =
                                          document.getElementById(
                                            `category-icon-${transaction.id}`
                                          );
                                        const svgIcon =
                                          iconElement.querySelector("svg");
                                        iconElement.innerHTML = "";

                                        iconElement.appendChild(svgIcon);
                                      }}
                                    />
                                    <span tw="text-white text-sm inline-block">
                                      {transaction.category_name}
                                    </span>{" "}
                                  </span>
                                </li>
                              </ul>
                            </td>
                          </tr>
                        )}
                      </React.Fragment>
                    ))}
                  </tbody>
                </TransactionsTable>
              </FAQContent>
            </section>
          </Column>
        </TwoColumn>
      </Content>
    </Container>
  );
};
