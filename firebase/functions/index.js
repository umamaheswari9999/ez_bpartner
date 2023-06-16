const functions = require("firebase-functions");
const axios_1 = require("axios");
const api = "https://sairoshni.nettlinx.com/erp";
const createUser = `${api}/ws/com.saksham.loandetails.sendSMS`;
const panValidationApi = 'https://api.digio.in/v3/client/kyc/fetch_id_data/PAN';
const ocrValidationApi = 'https://api.digio.in/v3/client/kyc/analyze/file/idcard';

exports.authHeader = functions.https.onCall(async (context) => {
    try {
        const username = functions.config().api.username;
        const password = functions.config().api.password;
        var headers = 'Basic ' + Buffer.from(username + ':' + password).toString('base64');
        return { response: headers };
    } catch (e) {
        console.log(e);
        return { error: e }
    }
});

exports.panAuthHeader = functions.https.onCall(async (context) => {
    try {
        const panusername = functions.config().api.panusername;
        const panpassword = functions.config().api.panpassword;
        var headers = 'Basic ' + Buffer.from(panusername + ':' + panpassword).toString('base64');
        return { response: headers };
    } catch (e) {
        console.log(e);
        return { error: e }
    }
});

exports.panValidation = functions.https.onCall(async (data, context) => {
    try {
        const panusername = functions.config().api.panusername;
        const panpassword = functions.config().api.panpassword;
        var authHeader = 'Basic ' + Buffer.from(panusername + ':' + panpassword).toString('base64');
        var response = await axios_1.post(panValidationApi, {
            id_no: data.pan,
            should_verify: 'Yes'
        }, {
            headers: {
                'authorization': authHeader,
                'Content-Type': 'application/json'
            }
        });
        return { response: response.data };
    } catch (e) {
        return { error: e }
    }
});


exports.ocrPanValidation = functions.https.onCall(async (data, context) => {
    try {
        const panusername = functions.config().api.panusername;
        const panpassword = functions.config().api.panpassword;
        var authHeader = 'Basic ' + Buffer.from(panusername + ':' + panpassword).toString('base64');
        const buffer = Buffer.from(data.filedata, 'base64');
        var FormData = require('form-data');
        
        var reqdata = new FormData();
        reqdata.append('should_verify', 'Yes');
        reqdata.append('X-Content-Type-Options', 'nosniff');
        reqdata.append('Content-Type', 'multipart/form-data');
        reqdata.append('X-Frame-Options', 'Deny');
        reqdata.append('front_part', buffer, 'PAN.jpeg');
        try{
            var response = await axios_1.post(ocrValidationApi, reqdata, {
                headers: {
                    'authorization': authHeader,
                    ...reqdata.getHeaders()
                }
            });
            return { response: response.data };
        } catch(e){
            return {error : e.response.data};
        }
    } catch (e) {
        console.log('Error in OCR Panvalidation');
        return { error: e }
    }
});