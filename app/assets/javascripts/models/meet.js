App.Meet = DS.Model.extend({
  opponent: DS.attr('string'),
  competitionDate: DS.attr('date'),

  heats: DS.hasMany('heat')
});