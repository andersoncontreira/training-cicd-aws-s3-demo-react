# training-cicd-aws-s3-demo-react
In this project we will study how to create a pipeline for a react app.

## Creating the project
### Create the project folder
Execute the follow commnad:
```
mkdir training-cicd-aws-demo-react
```
now go to app dir:
```
cd training-cicd-aws-demo-react
```

### Create the react app
Execute the follow command:
```
npx create-react-app . --template typescript
```

## Running the project
Execute the follow command:
```
npm start
```
Runs the app in the development mode.
Open http://localhost:3000 to view it in the browser.

## Building the project
Execute the follow command:
```
npm build
```

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

## Create the config files for AWS CodePipeline
First we need to create the buildspec.yml file, you can see in the folder samples/:


