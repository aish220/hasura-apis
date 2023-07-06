import React, { useState } from "react";
import tw from "twin.macro";
import styled from "styled-components";
import { css } from "styled-components/macro"; //eslint-disable-line
import { SectionHeading, Subheading as SubheadingBase } from "../../components/misc/Headings.js";
import { PrimaryButton as PrimaryButtonBase } from "../../components/misc/Buttons.js";
import EmailIllustrationSrc from "../../images/email-illustration.svg";

const Container = tw.div`relative`;
const TwoColumn = tw.div`flex flex-col md:flex-row justify-between max-w-screen-xl mx-auto`;
const Column = tw.div`w-full max-w-md mx-auto md:max-w-none md:mx-0`;
const ImageColumn = tw(Column)`md:w-5/12 flex-shrink-0 h-80 md:h-auto`;
const TextColumn = styled(Column)(props => [
  tw`md:w-7/12 mt-16 md:mt-0`,
  props.textOnLeft ? tw`md:mr-12 lg:mr-16 md:order-first` : tw`md:ml-12 lg:ml-16 md:order-last`
]);

const Image = styled.div(props => [
  `background-image: url("${props.imageSrc}");`,
  tw`rounded bg-contain bg-no-repeat bg-center h-full`,
]);
const TextContent = tw.div`lg:py-8 text-center md:text-left`;

const Subheading = tw(SubheadingBase)`text-center md:text-left`;
const Heading = tw(SectionHeading)`mt-4 font-black text-left text-3xl sm:text-4xl lg:text-5xl text-center md:text-left leading-tight`;
const Description = tw.p`mt-4 text-center md:text-left text-sm md:text-base lg:text-lg font-medium leading-relaxed text-secondary-100`

const Form = tw.form`mt-8 md:mt-10 text-sm flex flex-col max-w-sm mx-auto md:mx-0`
const Input = tw.input`mt-6 first:mt-0 border-b-2 py-3 focus:outline-none font-medium transition duration-300 hocus:border-primary-500`
const Textarea = styled(Input).attrs({ as: "textarea" })`${tw`h-24`}`

const SubmitButton = tw(PrimaryButtonBase)`inline-block mt-8`

const PlansContainer = tw.div`flex justify-center flex-wrap md:flex-nowrap md:justify-start flex-col md:flex-row items-center md:items-start relative`;

const Notification = styled.div`
  ${tw`justify-center items-center relative mx-auto flex pt-2 text-center bg-primary-100 text-white`}
  .notificationText {
    ${tw`px-8 pt-2 pb-4 font-bold`}
  }
`;

const Plan = styled.div`
  ${tw`w-full max-w-72 mt-16 md:mr-12 md:last:mr-0 text-center px-8 rounded-lg relative text-gray-900 bg-white flex flex-col shadow-raised`}
  
  ${props =>
    props.featured &&
    css`
      ${tw`border-2 border-gray-200 shadow-none`}
    `}
`;

const Application = styled.div`
  ${tw`w-full mt-16 md:mr-12 md:last:mr-0 text-center px-8 rounded-lg relative text-gray-900 bg-white flex flex-col shadow-raised`}
  
  ${props =>
    props.featured &&
    css`
      ${tw`border-2 border-gray-200 shadow-none`}
    `}
`;

const PlansWrapper = styled.div`
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1rem;

  ${Plan} {
    // max-width: calc(50% - 4rem);
  }

  @media (max-width: 767px) {
    ${Plan} {
      max-width: 100%;
    }
  }
`;

const PlanHeader = styled.div`
  ${tw`flex flex-col leading-relaxed py-8 -mx-8 bg-gray-100 rounded-t-lg`}
  .name {
    ${tw`font-bold text-xl mx-2 text-primary-400`}
  }
  .description {
    ${tw`text-gray-500 text-sm font-medium tracking-wide mx-2`}
  }
  .price {
    ${tw`font-bold text-4xl sm:text-5xl my-1`}
  }
  .slash {
    ${tw`text-xl text-gray-500`}
  }
  .duration {
    ${tw`lowercase text-gray-500 font-medium tracking-widest`}
  }
  .mainFeature {
    ${tw`text-gray-500 text-sm font-medium tracking-wide`}
  }
`;
const PlanFeatures = styled.div`
  ${tw`flex flex-col -mx-8 px-8 flex-1 text-sm text-left py-0`}
  .interest {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .interestRate {
    ${tw`font-bold text-2xl sm:text-2xl my-1 pl-5 text-primary-400`}
  }
  .fees {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .feesDollar {
    ${tw`pl-8`}
  }
  .feesRate {
    ${tw`font-bold text-2xl sm:text-2xl my-1 text-primary-400`}
  }
  .term {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .termTerm {
    ${tw`font-bold text-2xl sm:text-2xl my-1 pl-10 text-primary-400`}
  }
`;

const ApplicationFeatures = styled.div`
  ${tw`flex flex-col -mx-8 px-8 flex-1 text-sm text-left py-4`}
  .interest {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .application {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .applicationId {
    ${tw`pr-2`}
  }
  .applicationName {
    ${tw`pl-16`}
  }
  .product {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .productName {
    ${tw`pl-10`}
  }
  .amount {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .amountName {
    ${tw`pr-2`}
  }
  .amountDollar {
    ${tw`pl-16`}
  }
  .interestRate {
    ${tw`font-bold text-2xl sm:text-2xl my-1 pl-5 text-primary-400`}
  }
  .fees {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .feesDollar {
    ${tw`pl-32`}
  }
  .term {
    ${tw`pl-4 font-semibold text-gray-500`}
  }
  .termMonths {
    ${tw`pl-32`}
  }
`;

const PlanAction = tw.div`px-4 pb-8`;
const BuyNowButton = styled(PrimaryButtonBase)`
  ${tw`rounded-full tracking-wider py-4 w-full text-sm hover:shadow-xl transform hocus:translate-x-px hocus:-translate-y-px focus:shadow-outline`}
`;

export default ({
  token,
  subheading = "",
  heading = <>Apply below for an instant <span tw="text-primary-500">home loan</span><wbr /> decision</>,
  description = "HoloBank provides instant credit checking, fraud detection, and approval to get you a decision on your home loan in seconds.",
  submitButtonText = "Apply",
  textOnLeft = false,
}) => {
  const [response, setResponse] = useState(null);
  const [application, setApplication] = useState(null);
  const [loading, setLoading] = useState(false);
  const [income, setIncome] = useState(null);
  const [amount, setAmount] = useState(null);
  const [error, setError] = useState(null);


  let secure = '';
  if (process.env.NODE_ENV == 'production') {
    secure = 's';
  }

  const handleSubmit = async (event) => {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    const term = formData.get('term');
    const formTfn = formData.get('tfn');
    const formName = formData.get('name');
    const formAmount = formData.get('amount');
    const formIncome = formData.get('income');
    setAmount(formAmount);
    setIncome(formIncome);

    const options = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    };

    setLoading(true);
    setTimeout(async () => {
      try {
        const response = await fetch(`http${secure}://${process.env.REACT_APP_REST_API_URL}/homeloan/${formTfn}/${term}`, options);
        const data = await response.json();
        console.log(data);
        if (data.error) {
          console.error(error);
          setError(true);
        } else {
          setError(false)
          setResponse(data);
        }
      } catch (error) {
        console.error(error);
      } finally {
        setLoading(false);
      }
    }, 2000);
  };

  const handleSubmitApply = async (event) => {
    console.log(event.target)
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);

    const data = {
      customerId: parseInt(formData.get('customerId')),
      tfn: parseInt(formData.get('tfn')),
      loanId: formData.get('loanId'),
      loanAmount: parseInt(formData.get('loanAmount')),
    };

    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    };

    setLoading(true);
    setTimeout(async () => {
      try {
        const response = await fetch(`http${secure}://${process.env.REACT_APP_REST_API_URL}/homeloan/apply`, options);
        const data = await response.json();
        console.log(data);
        setApplication(data);
      } catch (error) {
        console.error(error);
      } finally {
        setLoading(false);
      }
    }, 2000);
  };

  return (
    <Container>
      <TwoColumn>
        <ImageColumn>
          <Image imageSrc={EmailIllustrationSrc} />
        </ImageColumn>
        <TextColumn textOnLeft={textOnLeft}>
          <TextContent>
            {subheading && <Subheading>{subheading}</Subheading>}
            <Heading id='application-form'>{heading}</Heading>
            {description && <Description>{description}</Description>}
            {error && <Notification><span className="notificationText">Unable to find TFN or Customer Record. You must be an existing customer of HoloBank to use InstantApply.</span></Notification>}
            {loading ? (
              <div tw="flex items-center justify-center h-24">
                <div tw="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
              </div>
            ) : (
              <>
                {application ? (
                  <PlansContainer>
                    <PlansWrapper>
                      <Application>
                        <PlanHeader>
                          <span className="name">Application Created</span>
                          <span className="description">{application.postHomeLoansApplication.status}</span>
                        </PlanHeader>
                        <ApplicationFeatures>
                          <span className="product">
                            <span className="productText">HoloBank Product: </span>
                            <span className="productName">{application.postHomeLoansApplication.name}</span>
                          </span>
                          <span className="application">
                            <span className="applicationId">Application ID:</span>
                            <span className="applicationName">{application.postHomeLoansApplication.applicationId}</span>
                          </span>
                          <span className="amount">
                            <span className="amountName">Loan Amount: </span>
                            <span className="amountDollar"> {application.postHomeLoansApplication.loanAmount}</span>
                          </span>
                          <span className="fees">
                            <span className="feesName">Fees: </span>
                            <span className="feesDollar">${application.postHomeLoansApplication.fees}</span>
                          </span>
                          <span className="term">
                            <span className="termName">Term: </span>
                            <span className="termMonths">{application.postHomeLoansApplication.term} months</span>
                          </span>
                        </ApplicationFeatures>
                      </Application>
                    </PlansWrapper>
                  </PlansContainer>
                ) : (
                  <>
                    {response ? (
                      <>
                        <Notification tw="text-left"><span className="notificationText" tw="text-left">Customer: {response.getCreditScore.Customer.name}<br />Credit Score: {response.getCreditScore.score}</span></Notification>
                        <PlansContainer>
                          <PlansWrapper>
                            {response.getHomeLoans.map((loan, index) => (
                              <form key={index} action="submit-url" method="post" onSubmit={handleSubmitApply}>
                                <input type="hidden" name="annualIncome" value={income} />
                                <input type="hidden" name="loanAmount" value={amount} />
                                <input type="hidden" name="loanTerm" value={loan.term} />
                                <input type="hidden" name="tfn" value={response.getCreditScore.tfn} />
                                <input type="hidden" name="customerName" value={response.getCreditScore.Customer.name} />
                                <input type="hidden" name="customerId" value={response.getCreditScore.Customer.id} />
                                <input type="hidden" name="creditScore" value={response.getCreditScore.score} />
                                <input type="hidden" name="id" value={loan.id} />
                                <input type="hidden" name="loanId" value={loan.id} />
                                <input type="hidden" name="term" value={loan.term} />
                                <Plan>
                                  <PlanHeader>
                                    <span className="name">{loan.name}</span>
                                    <span className="description">{loan.description}</span>
                                  </PlanHeader>
                                  <PlanFeatures>
                                    <span className="interest">
                                      <span className="interestName">Interest: </span>
                                      <span className="interestRate">{loan.interestRate}</span>
                                      <span className="interestPercent">%</span>
                                    </span>
                                    <span className="fees">
                                      <span className="feesName">Fees: </span>
                                      <span className="feesDollar">$</span>
                                      <span className="feesRate">{loan.fees}</span>
                                    </span>
                                    <span className="term">
                                      <span className="termName">Term: </span>
                                      <span className="termTerm">{loan.term}</span>
                                      <span className="termMonths"> months</span>
                                    </span>
                                  </PlanFeatures>
                                  <PlanAction>
                                    <SubmitButton type="submit">Apply</SubmitButton>
                                  </PlanAction>
                                </Plan>
                              </form>
                            ))}
                          </PlansWrapper>
                        </PlansContainer>
                      </>
                    ) : (
                      <Form onSubmit={handleSubmit}>
                        <Input type="text" name="tfn" placeholder="Your Tax File Number" />
                        <Input type="text" name="income" placeholder="Your annual income" />
                        <Input type="text" name="amount" placeholder="Your desired loan amount" />
                        <Input type="text" name="term" placeholder="Your ideal term length" />
                        <SubmitButton type="submit">{submitButtonText}</SubmitButton>
                      </Form>
                    )}
                  </>
                )}
              </>
            )}
            {response && <div>{response.message}</div>}
          </TextContent>
        </TextColumn>
      </TwoColumn>
    </Container>
  );
};
