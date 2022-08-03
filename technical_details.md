## Back-End

The back-end is driven by an [express 4.18](https://www.npmjs.com/package/express) framework run through [Next.js](https://nextjs.org/docs/getting-started)'s middleware system, hosted on a [google cloud virtual machine ](https://cloud.google.com/compute).
The data is communicated from an [SQL server](https://www.microsoft.com/en-ca/sql-server/sql-server-downloads) hosted on a google cloud virtual machine to the front-end using REST api

## Front-End

The front-end uses the [Next.js](https://nextjs.org/docs/getting-started) framework to implement a module based template driven application and [Bootstrap 5](https://getbootstrap.com/docs/5.0/getting-started/introduction/) to style
No other libraries are currently used.

## Developing tools

The website is developed using [VisualStudio Code](https://code.visualstudio.com/) as the primary IDE. [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=rodrigovallades.es7-react-js-snippets) is used for shortcuts to save on typing.
[Postman](https://learning.postman.com/docs/sending-requests/supported-api-frameworks/graphql/#using-postmans-built-in-support-for-graphql) is used to test requests during development to prevent strain to the live server. 
