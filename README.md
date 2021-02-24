# training-cicd-aws-s3-demo-react
In this project we will study how to create a pipeline for a react app.

## Creating the project
### Create the project folder
Execute the follow command:
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
First we need to create the buildspec.yml file, with this content:

```yml
version: 0.2
env:
  variables:
    PROJECT_NAME: "training-cicd-aws-s3-demo-react"
    REGION: "sa-east-1"
phases:
  install:
    runtime-versions:
      nodejs: 12.x
    commands:
      - echo Installing all requirements
      - npm install
  build:
    commands:
      - npm run build
artifacts:
  base-directory: build
  files:
    - '**/*'
```
> Obs: The project already have this file.

## Configuring resources in the AWS

### Creating the S3 bucket
Create a bucket in the S3 service with this name `s3-demo-react-{username}`.
> Obs: 
> In the place of {username} put you name, example: s3-demo-react-andersoncontreira. 
>
> Let the bucket public.

### Activating the static website hosting
Select the bucket, go to the properties and click in the Rdit the section `Static website hosting`.

Select: 
 - Static website hosting as Enable;
 - Hosting type as Host a static website;
 - Index document as index.html;
 - Error document as index.html.

Save Changes.

This property will generate a link like this:
[http://s3-demo-react-andersoncontreira.s3-website-us-east-1.amazonaws.com/](http://s3-demo-react-andersoncontreira.s3-website-us-east-1.amazonaws.com/)

### Bucket policy
Go to the Permission tabs and edit the Bucket Policy with this code:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::s3-demo-react-{username}/*"
        }
    ]
}
```
> Obs:
> In the place of {username} put you name, example: s3-demo-react-andersoncontreira. 
 
 
After this, the bucket will have the red badge `Publicly accessible`.

## Creating the Pipeline
Go to the AWS CodePipeline console and create a pipeline.

### Init
- Pipeline name: training-cicd-aws-s3-demo-react
- Service role: New service role

### Source
- Source Provider: GitHub (Version 2)
- Connection: Click in Connect to Github

> Obs: A pop will be opened. 

### Creating a Github Connection
Connection name: {username}-github

Allow the AWS to you Github account.

Github apps:
- Click in Install a new app
- Choose the repository  
 - Obs: The window will be redirected to Install AWS Connector for GitHub
- Choose the option: Only select repositories
- Find the repository {githubaccount}/training-cicd-aws-s3-demo-react
- Install 
- Confirm you password
- After this, click in the button connect

### Choosing the github repository
Continuing the last step of source:
- Repository name: {githubaccount}/training-cicd-aws-s3-demo-react
- Branch name: main
- Change detection options: let checked
- Output artifact format: CodePipeline default

### Add build stage
Choose the AWS CodeBuild

#### Create project
Click in the button Create project


