//Require Mongoose
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var IntroSchema = new Schema({
    description: String,
    viedoUrl: String,
    durationMin: Number,
    durationHour: Number,
    difficulty: String,
    title: String,
    source: String,
    serves: Number,
});

module.exports = mongoose.model('Intro', IntroSchema);
