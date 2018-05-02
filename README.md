# harp.adhad-america.com

Marketing website for ADHD America. Created with nodejs, harpjs, jade/pug and Sass. Built with Travis CI and Hosted on GitHub.

### Prerequisites

1. nodejs
2. npm

### Project Setup

1. Install harp ```$ npm install -g harp```
   *The harpjs package is now installed globally.*
2. Clone repo ``` $ git clone https://github.com/thomasdeitz/harp.adhd-america.com.git``` . 
   *The projects source code is now on your local machine in a directory named harp.harp.adhd-america.com.*

3. Navigate to the project folder ```$ cd harp.harp.adhd-america.com```.
4. Run the project ```$ harp server``` 
   *The project should now be running and  accessible at /localhost:9000.*


### Working with the Project

##### Branches

```
$ git branch
* dev        <-- build & auto deploys Dev for UAT
  master     <-- build & auto deploys to Prod for production
```

* Dev: http://adhd-america-dev.s3-website-us-east-1.amazonaws.com/
* Prod Origin (no caching): http://adhdamerica.org.s3-website-us-east-1.amazonaws.com/
* Prod Main (Possibly cached): https://adhdamerica.org/

##### Deployment Path

```
dev –– mereges into ––> master
```

##### Helpful harp Documentation

1. [Rules](http://harpjs.com/docs/development/rules)
2. [Layout](http://harpjs.com/docs/development/layout)
3. [Partials](http://harpjs.com/docs/development/partial)
4. [Globals](http://harpjs.com/docs/development/globals)
5. [Metadata](http://harpjs.com/docs/development/metadata)

### Libraries & Technology

1. [harpjs](harpjs.com) - The static web server with built-in preprocessing.
2. [Jade/Pug](https://pugjs.org/api/getting-started.html) - Pug is a high-performance template engine heavily influenced by [Haml](http://haml.info/) and implemented with JavaScript for [Node.js](http://nodejs.org/) and browsers.
3. [Sass](sass-lang.com) - CSS with superpowers: Sass is the most mature, stable, and powerful professional grade CSS extension language in the world.
4. [Travis CI](travis-ci.org) - Build apps with confidence: Focus on writing code. Let Travis CI take care of running your tests and deploying your apps.
5. [GitHub](github.com) - The world's leading software development platform


