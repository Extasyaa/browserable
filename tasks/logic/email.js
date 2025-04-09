const nodemailer = require("nodemailer");

// create reusable transporter object using the default SMTP transport
let transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: Number(process.env.SMTP_PORT),
    secure: Number(process.env.SMTP_PORT) === 465, // true for 465, false for other ports
    auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASS,
    },
});

// async..await is not allowed in global scope, must use a wrapper
async function emailOTP({ email, otp }) {
    let info = await transporter.sendMail({
        from: `"Support" <${process.env.SMTP_FROM}>`, // sender address
        to: email, // list of receivers
        subject: `OTP for Browserable`, // Subject line
        html: `<p><b>Hello!</b><br/><br/> You asked us to send you an OTP for signing in to your Browserable account.<br/> Your wish is our command ✨ <br/><br/>Here's your OTP: <b>${otp}</b>.<br/></p> 
						<p>Note: Your OTP can only be used one time.</p>
						<p>See you soon!</p>
						Cheers<br/>
						Team Browserable`,
        text: `Hello! you asked us to send you an OTP for signing in to your btw account. Your wish is our command! ✨. Here's your OTP: ${otp}. Note: Your OTP will expire in 2 hours, and can only be used one time. See you soon! Cheers, Team Browserable`,
    });

    console.log("Message sent: %s", info.messageId);
}

async function sendEmail({
    email,
    subject,
    html,
    text,
}) {
    let info = await transporter.sendMail({
        from: `"Support" <${process.env.SMTP_FROM}>`, // sender address
        to: email, // list of receivers
        subject,
        html,
        text,
    });
    console.log("Message sent: %s", info.messageId);
}

module.exports = {
    emailOTP,
    sendEmail,
};

