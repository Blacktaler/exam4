//Require Mongoose
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var InstructionSchema = new Schema({
    intro: [{ type: Schema.Types.ObjectId, ref: 'Intro' }],
    ingredients: String,
    steps: String,
});

module.exports = mongoose.model('Instruction', InstructionSchema);
