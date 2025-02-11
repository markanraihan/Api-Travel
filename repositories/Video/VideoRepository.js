// VideoRepository.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

class VideoRepository {
  async findAll() {
    return await prisma.video.findMany();
  }

  async findById(videoid) {
    return await prisma.video.findUnique({ where: { videoid } });
  }

  async create(data) {
    return await prisma.video.create({ data });
  }

  async update(videoid, data) {
    return await prisma.video.update({ where: { videoid }, data });
  }

  async delete(videoid) {
    return await prisma.video.delete({ where: { videoid } });
  }
}

module.exports = new VideoRepository();