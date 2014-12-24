// For more information see: http://emberjs.com/guides/routing/
App.Router.reopen({
  location: 'auto',
  rootURL: '/'
});

App.Router.map(function() {
  this.resource('users', { path: '/' }, function() {
    this.resource('user', { path: '/users/:id' }, function() {
      this.route('edit');
    });
  });
});
