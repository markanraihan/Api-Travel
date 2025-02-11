const prisma = require("../utils/Prisma");
const userWithGroups = await prisma.users.findUnique({
  where: { id: "22a37b48-d2d4-4dcb-8db9-a55935a8a22f" },
  include: { grup: true },
});
console.log(userWithGroups);
