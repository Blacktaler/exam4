// To parse this JSON data, do
//
//     final recipeSchema = recipeSchemaFromJson(jsonString);

import 'dart:convert';

RecipeSchema recipeSchemaFromJson(String str) => RecipeSchema.fromJson(json.decode(str));

String recipeSchemaToJson(RecipeSchema data) => json.encode(data.toJson());

class RecipeSchema {
    RecipeSchema({
        this.id,
        this.like,
        this.uid,
        this.username,
        this.userPhoto,
        this.instruction,
        this.v,
    });

    final String? id;
    final int? like;
    final String? uid;
    final String? username;
    final String? userPhoto;
    final List<Instruction>? instruction;
    final int? v;

    factory RecipeSchema.fromJson(Map<String, dynamic> json) => RecipeSchema(
        id: json["_id"],
        like: json["like"],
        uid: json["UID"],
        username: json["username"],
        userPhoto: json["user_photo"],
        instruction: List<Instruction>.from(json["instruction"].map((x) => Instruction.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "like": like,
        "UID": uid,
        "username": username,
        "user_photo": userPhoto,
        "instruction": List<dynamic>.from(instruction!.map((x) => x.toJson())),
        "__v": v,
    };
}

class Instruction {
    Instruction({
        this.id,
        this.intro,
        this.ingredients,
        this.steps,
        this.v,
    });

    final String? id;
    final List<Intro>? intro;
    final String? ingredients;
    final String? steps;
    final int? v;

    factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        id: json["_id"],
        intro: List<Intro>.from(json["intro"].map((x) => Intro.fromJson(x))),
        ingredients: json["ingredients"],
        steps: json["steps"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "intro": List<dynamic>.from(intro!.map((x) => x.toJson())),
        "ingredients": ingredients,
        "steps": steps,
        "__v": v,
    };
}

class Intro {
    Intro({
        this.id,
        this.description,
        this.viedoUrl,
        this.durationMin,
        this.durationHour,
        this.difficulty,
        this.title,
        this.source,
        this.serves,
        this.v,
    });

    final String? id;
    final String? description;
    final String? viedoUrl;
    final int? durationMin;
    final int? durationHour;
    final String? difficulty;
    final String? title;
    final String? source;
    final int? serves;
    final int? v;

    factory Intro.fromJson(Map<String, dynamic> json) => Intro(
        id: json["_id"],
        description: json["description"],
        viedoUrl: json["viedoUrl"],
        durationMin: json["durationMin"],
        durationHour: json["durationHour"],
        difficulty: json["difficulty"],
        title: json["title"],
        source: json["source"],
        serves: json["serves"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "viedoUrl": viedoUrl,
        "durationMin": durationMin,
        "durationHour": durationHour,
        "difficulty": difficulty,
        "title": title,
        "source": source,
        "serves": serves,
        "__v": v,
    };
}
