
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var AccountSchema = new Schema({
    name: {type: String,required:true },
    email: {type: String,required: false},
    phone: {type: Number,required: true},
    bio: {type: String,required: false}    
});



module.exports = mongoose.model('Account', AccountSchema);