var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var RecipeSchema = new Schema({
    like: Number,
    UID: Schema.Types.ObjectId,
    username: String,
    user_photo: String,
    instruction: [{ type: Schema.Types.ObjectId, ref: 'Instruction' }],
});

module.exports = mongoose.model('Recipe', RecipeSchema);