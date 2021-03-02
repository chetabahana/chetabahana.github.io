---
layout: coffee
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://medium.com/@atilafassina/es2015-modules-101-d9977dc4d4c7*
---
import Resolver from 'resolver';

MyComponent = Ember.Component.extend
  classNames: ['pretty-color']
  attributeBindings: ['style']
  style: (->
    "color: #{@get('name')};"
  ).property('name')

`export default MyComponent`
