# Routing Documentation

This document describes the routing system that is used in the Kitawi Library.

## Overview

The Kitawi Library provides a routing system that allows the user to define a set of routes that can be used to navigate between different pages in the application.

### Router.init(`List<Route>`, `Element root`)

- #### Description

  The `Router.init()` method initializes the router.

- ##### Parameters

- `routes`

  The `routes` parameter is a list of `Route` objects that define the routes that the router will use to navigate between different pages in the application.

- `root`

        The `root` parameter is an `Element` that will be used as the root of the application.

- ##### Example

  ```dart
      Router.init([
          Route(
              name: 'home',
              path: '/',
              builder: () => HomeScreen(),
          ),
          Route(
              name: 'about',
              path: '/about',
              builder: () => AboutScreen(),
          ),
        ],
        root: root
      );
  ```

### Router.push(String path)

- #### Description

  The `Router.push()` method pushes a new route onto the router's history stack.

- ##### Parameters

- `path`

  The `path` parameter is a string that represents the path of the route that will be pushed onto the router's history stack.

- ##### Example

  ```dart
    Router.push('/about');
  ```

### Router.pop()

- #### Description

  The `Router.pop()` method pops the current route off the router's history stack.

- ##### Example

  ```dart
      Router.pop();
  ```
