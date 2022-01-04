var express = require('express');
var router = express.Router();

var Account = require('../schemas/account/account_schema');

router.post('/signup', async function (req, res, next) {
    console.log(req.body.name);
    console.log(req.body.phone);

    let phLast = req.body.phone.toString();
    let rand = phLast[phLast.length - 1] + req.body.name.length;

    var account = await Account.create({
        name: req.body.name,
        phone: req.body.phone,
        user_photo: `https://source.unsplash.com/random/${rand}`,
        email: "",
        bio: ""
    });

    res.send(account);
});

router.post('/signin', async function (req, res, next) {
    const number = req.body.phone
    var account = await Account.findOne({
        'phone': number, function(err, person) {
            if (err) return handleError(err);
        }
    });

    console.log(account)

    res.send(account);
});

router.post('/checkvalidate', async function (req, res, next) {
    const number = req.body.phone
    try {
        var account = await Account.findOne({
            'phone': number, function(err, person) {
                if (err) return handleError(err);
            }
        });

        if (account) {
            res.send({
                "ok": true,
                "isExists": true,
            });;
        } else {
            res.send({
                "ok": true,
                "isExists": false,
            })

        }
    } catch (error) {
        res.send(error)
    }
});

router.get('/', async function (req, res, next) {
    var account = await Account.find({});
    res.send(account);
});

router.get('/:user_id', async function (req, res, next) {
    const id = req.params.user_id;
    var account = await Account.findById(id);
    res.send(account);
});

module.exports = router;