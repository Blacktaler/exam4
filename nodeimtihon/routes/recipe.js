var express = require('express');
var router = express.Router();

var Recipe = require('../schemas/recipe/recipe_schema');
var Instruction = require('../schemas/recipe/instruction_schema');
var Intro = require('../schemas/recipe/intro_schema');

router.get('/', async function (req, res, next) {
  try {
    var recipes = await Recipe.find().populate({
      path: 'instruction', populate: {
        path: 'intro'
      }
    });

    res.send(recipes);
  } catch (error) {
    console.log(error);
    res.status(500).json({ success: false, msg: error.message });
  }
});

router.get('/:recipeId', async function (req, res, next) {
  const recipeId = req.params.recipeId;
  try {
    var recipes = await Recipe.findById(recipeId).populate({
      path: 'instruction', populate: {
        path: 'intro'
      }
    });

    res.send(recipes);
  } catch (error) {
    console.log(error);
    res.status(500).json({ success: false, msg: error.message });
  }
});

router.post('/create/:userid', async function (req, res, next) {
  const id = req.params.userid;
  try {

    var intro = await Intro.create({
      description: req.body.description,
      viedoUrl: req.body.viedoUrl,
      durationMin: req.body.durationMin,
      durationHour: req.body.durationHour,
      difficulty: req.body.difficulty,
      title: req.body.title,
      source: req.body.source,
      serves: req.body.serves,
    });

    var instruction = await Instruction.create({
      ingredients: req.body.ingredients,
      steps: req.body.steps,
    });

    instruction.intro.push(intro);
    instruction.save();

    var recipe = await Recipe.create({
      UID: id,
      like: req.body.like,
    });

    recipe.instruction.push(instruction);
    recipe.save();

    res.send(recipe);

  } catch (error) {
    res.status(500).json({ success: false, msg: error.message });
  }
});


router.post('/search', async function (req, res, next) {
  const title = req.body.title;
  try {
    var recipes = await Recipe.find().populate({
      path: 'instruction', populate: {
        path: 'intro'
      }
    });

    const searched = []

    recipes.map((recipe) => {
      console.log(recipe);

      if (recipe.instruction[0].intro[0].title.includes(title)) {
        searched.push(recipe)
      }
    })

    res.send(searched);

  } catch (error) {
    res.status(500).json({ success: false, msg: error.message });
  }
});

router.put("/edit/:recipeid", async function (req, res, next) {
  console.log(req.params.recipeid);

  const recipeId = req.params.recipeid

  const recipe = await Recipe.findById(recipeId);

  const instruction = await Instruction.findById(recipe.instruction[0]);

  const introId = instruction.intro[0];

 Intro.findByIdAndUpdate(introId, { "title": req.body.title }, function (err, result) {
    if (err) {
      res.send({"ok": false, "message": err})
    }
    else {
      res.send({
        "ok": true,
        "message": "Recipe edited!"
      });
    }

  });
});

module.exports = router;
