const createError = require("../utils/createError")
const prisma = require("../config/prisma")

exports.register = (req , res , next) => {
    res.json({message : " Register for you"})
};

exports.login = (req , res , next) => {
    res.json({ message : " Login for you"})
};

exports.forgetPassword = ( req , res , next) => {
    res.json({ message : " Forget  Password "})
};

exports.verifyForgetPassword = (req , res , next) => {
    res.json({ message : " Verify Forget Password"})
};

exports.resetPassword = (req , res , next) => {
    res.json({message : " Reset Password"})
};