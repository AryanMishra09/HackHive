const nodemailer = require('nodemailer');
const { mail } = require('../utils/nodemailerConfig');

//for email verification : 
const SendVerifyEmail = async (username, email, token) => {
    try{
        const transporter =nodemailer.createTransport({
            host: "smtp.gmail.com",
            port: 587,
            secure: false,
            requireTLS: true,
            auth: {
                user: mail.emailUser,
                pass: mail.emailPassword,
            }
        });
        const mailOptions = {
            from : mail.emailUser,
            to: email,
            subject: "<OTP> For Email Verification",
            html: `<p> 
                        Hii ${username}, <br/> <br />  
                        You requested to register in Wellness Warriors. 
                        <br /> <br />  
                        Please, use the OTP below to verify you email.
                        <br /> <br />  
                        OTP : ${token}
                        <br /> <br />
                        Hope you have Good Day dear ${username}💕
                    </p>`
        }
        transporter.sendMail(mailOptions, (error, information)=>{
            if(error){
                console.log("error: ", error);
            }else{
                console.log("Mail has been sent. Info: ", information.response);
            }
        })
    }catch(error){
        console.log("Error: ",error);
    }
}

module.exports = { SendVerifyEmail };