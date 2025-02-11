const prisma = require("../utils/Prisma");


const getValidationGrupByid = async (grupid) => {
    return await prisma.grup.findUnique({
        where: {
            grupid,
        },
    });
};

module.exports = {
    getValidationGrupByid,
}