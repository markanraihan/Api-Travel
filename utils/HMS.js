const axios = require("axios");

const HMS = {
  createRoom: async (roomName) => {
    return axios.post("https://api.100ms.live/v2/rooms", { name: roomName, template_id: process.env.HMS_TEMPLATE_ID }, { headers: { Authorization: `Bearer ${process.env.HMS_API_KEY}` } });
  },
};

module.exports = HMS;
