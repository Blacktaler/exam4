var express = require('express');
var router = express.Router();

var Recipe = require('../schemas/recipe/recipe_schema');
var LastSeen = require('../schemas/lastseen/lastseen_schema');

// router.get('/:lastseen_id', async function (req, res, next) {
//     let lastseen_id = req.params.lastseen_id;

//     try {
//         var lastseen = await LastSeen.findById(lastseen_id);
//         var recipe = await Recipe.findById(lastseen.recipe_id).populate({
//             path: 'instruction', populate: {
//                 path: 'intro'
//             }
//         });

//         res.send(recipe);
//     } catch (error) {
//         console.log(error);
//         res.status(500).json({ success: false, msg: error.message });
//     }
// });

router.get('/:user_id', async function (req, res, next) {
    let user_id = req.params.user_id;

    try {
        let recipes = []

        var lastseens = await LastSeen.find({
            "user_id": user_id,
        });

        for (const lastseen of lastseens) {
            var recipe = await Recipe.findById(lastseen.recipe_id).populate({
                path: 'instruction', populate: {
                    path: 'intro'
                }
            });

            recipes.push(recipe);
        }

        res.send(recipes);
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, msg: error.message });
    }
});

module.exports = router;