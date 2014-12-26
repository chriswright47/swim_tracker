// For more information see: http://emberjs.com/guides/routing/
App.Router.reopen({
  location: 'auto',
  rootURL: '/'
});

App.Router.map(function() {
  this.resource('athletes', { path: '/athletes' }, function() {
    this.route('new');
    this.resource('athlete', { path: '/:id' }, function() {
      this.route('edit');
    });
  });

  this.resource('meets', { path: '/meets' }, function() {
    this.route('new');
    this.resource('meet', { path: '/:id' }, function() {
      this.route('edit');
    });
  });
});
