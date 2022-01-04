var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var LastSeenSchema = new Schema({
    user_id: String,
    recipe_id: String,
});

module.exports = mongoose.model('LastSeen', LastSeenSchema);