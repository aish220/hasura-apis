import { gql } from "@apollo/client";

export const GET_TRANSACTIONS_BEFORE = gql`
query getTransactionsBefore @cached {
  accounts {
    id
    name
    transactionsByAccountIdTo {
      id
      amount
      description
      from
      created_at
      receipt_id

    }
    transactionsByAccountIdFrom {
      id
      amount
      description
      from
      created_at
      receipt_id

    }
    user_accounts {
      user {
        name
      }
    }
    transactionsByAccountIdFrom_aggregate {
      aggregate {
        sum {
          amount
        }
      }
    }
    transactionsByAccountIdTo_aggregate {
      aggregate {
        sum {
          amount
        }
      }
    }
  }
  credit_cards_public {
    cvv
    expiry
    number_dec
    accountid
    balance
  }
}

`;

export const GET_TRANSACTIONS_AFTER = gql`
query getTransactionsAfter @cached {
  accounts {
    id
    name
    transactionsByAccountIdTo {
      id
      amount
      description
      from
      created_at
      receipt_id
      transactionCategoryByTransactionCategory {
        name
        icon
      }
    }
    transactionsByAccountIdFrom {
      id
      amount
      description
      from
      created_at
      receipt_id
      transactionCategoryByTransactionCategory {
        name
        icon
      }
    }
    user_accounts {
      user {
        name
      }
    }
    transactionsByAccountIdFrom_aggregate {
      aggregate {
        sum {
          amount
        }
      }
    }
    transactionsByAccountIdTo_aggregate {
      aggregate {
        sum {
          amount
        }
      }
    }
  }
	 credit_cards_public {
    cvv
    expiry
    number_dec
    accountid
    balance
  }
}
`;

export const SUB_POINTS = gql`
subscription getPoints {
  points {
    id
    points_balance
    customerId
  }
}
`;

export const GET_NAME = gql`
query getName @cached {
  users {
    name
  }
}
`;

export const GET_TRAVEL = gql`
subscription TravelItems {
  points_catalogue(where: { category: { _eq: "Travel" } }, limit: 8, order_by: { points_club: desc }) {
    category
    cost
    description
    destination
    id
    image
    points_club
    rating
    reviewers
  }
}`

export const GET_FOOD = gql`
subscription FoodItems {
  points_catalogue(where: { category: { _eq: "Food" } }, limit: 8, order_by: { points_club: desc }) {
    category
    cost
    description
    destination
    id
    image
    points_club
    rating
    reviewers
  }
}`

export const GET_EXPERIENCES = gql`
subscription ExperienceItems {
  points_catalogue(where: { category: { _eq: "Experiences" } }, limit: 8, order_by: { points_club: desc }) {
    category
    cost
    description
    destination
    id
    image
    points_club
    rating
    reviewers
  }
}`

export const GET_HOMEWARES = gql`
subscription HOMEWARE_ITEMS {
  points_catalogue(where: { category: { _eq: "Homewares" } }, limit: 8, order_by: { points_club: desc }) {
    category
    cost
    description
    destination
    id
    image
    points_club
    rating
    reviewers
  }
}`

export const SNOWFLAKE_USER_INTERACTIONS = gql`
query GetCustomerServiceInteractionSums {
  OPERATIONAL_DATA {
    CUSTOMER_SERVICE_INTERACTIONS
  }
}`
