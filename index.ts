import { PrismaClient } from '@prisma/client'
import express from 'express';
import path from 'path';

const prisma = new PrismaClient()
const app = express();
const port = 3000;

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

async function main() {
    app.get('/customers', async (req, res) => {
        try {
            const allCustomers = await prisma.customers.findMany();
            // res.json(allCustomers);
            res.render('index', {customers: allCustomers});
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    });
}

main()
    .then(async () => {
        await prisma.$disconnect()
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit(1)
    })

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
    