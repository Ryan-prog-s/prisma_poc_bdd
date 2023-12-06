import { PrismaClient } from '@prisma/client'
import express from 'express';
import path from 'path';

import swaggerUi from 'swagger-ui-express';
import swaggerJsdoc from 'swagger-jsdoc';

const prisma = new PrismaClient(
    {log: ['query']}
)
const app = express();
const port = 3000;

const options = {
    definition: {
      openapi: '3.0.0',
      info: {
        title: 'Express API with Swagger',
        version: '1.0.0',
      },
    },
    apis: ['index.ts'], // files containing annotations as above
};

const openapiSpecification = swaggerJsdoc(options);

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(openapiSpecification));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

async function main() {
    /**
     * @swagger
     * /customers:
     *   get:
     *     description: Get all customers
     *     responses:
     *       200:
     *         description: Success
     *
     */
    app.get('/customers', async (req, res) => {
        try {
            const allCustomers = await prisma.customers.findMany();
            res.render('index', {customers: allCustomers});
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    });

    /**
     * @swagger
     * /employees/{city}:
     *   get:
     *     description: Get all employess in a city 
     *     responses:
     *       200:
     *         description: Success
     *
     */
    app.get('/employees/:city', async (req, res) => {
        let city = req.params.city;
        try {
            const filterEmployee = await prisma.employees.findMany({
                where: {
                    City: city
                }
            })
            res.json(filterEmployee);
        }
        catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    })

     /**
     * @swagger
     * /products:
     *   get:
     *     description: Get all products
     *     responses:
     *       200:
     *         description: Success
     *
     */
    app.get('/products', async(req, res) => {
        try {
            const products = await prisma.products.findMany();
            res.json(products);
        }
        catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    })
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
    