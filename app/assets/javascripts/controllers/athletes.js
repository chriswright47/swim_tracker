App.AthletesController = Ember.ArrayController.extend({
  sortProperties: ['firstName', 'lastName'],

  athletes: function() {
    return this.get('search') ? this.get('searchedAthletes') : this;
  }.property('search', 'searchedAthletes'),

  searchedAthletes: function() {
    var search = this.get('search').toLowerCase();
    return this.filter(function(athlete) {
      return athlete.get('fullName').toLowerCase().indexOf(search) != -1
    });
  }.property('search', 'this.@each.fullName')
});