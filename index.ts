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
        title: 'Northwind Database with Prisma',
        version: '1.0.0',
        description: 'This a REST Api for an SQL Server Database with Express and Prisma',
        contact: {
            name: 'Ryan Guillerm',
            url: 'https://ryan-guillerm.netlify.app/'
        },
        servers: [
            {
              url: 'http://localhost:3000',
              description: 'Development server',
            },
          ],
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
     */
    app.get('/customers', async (req, res) => {
        try {
            const allCustomers = await prisma.customers.findMany({});
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
    
     /**
     * @swagger
     * /categories:
     *   get:
     *     description: Get all products
     *     responses:
     *       200:
     *         description: Success
     */
    app.get('/categories', async (req, res) => {
        try {
            const categories = await prisma.categories.findMany({
                select: {
                    CategoryID: true,
                    CategoryName: true,
                    Description: true
                }
            });
            res.json(categories);
        }
        catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    })   

    /**
     * @swagger
     * /customers_orders:
     *   get:
     *     description: Join between products and orders
     *     responses:
     *       200:
     *         description: Success
     */
    app.get('/customers_orders', async (req, res) => {
        try {
           const customersWithOrders = await prisma.customers.findMany({
            take: 5,
            select: {
                CustomerID: true,
                ContactName: true,
                CompanyName: true,
                Orders: {
                    select: {
                        ShipName: true,
                        ShipCity: true
                    }
                }
            }
           }) 
           res.json(customersWithOrders);
        }
        catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    })

    /**
     * @swagger
     * /customers_no_orders:
     *   get:
     *     description: Customers that doesn't have orders
     *     responses:
     *       200:
     *         description: Success
     */
    app.get('/customers_no_orders', async (req, res) => {
        try {
            const customersWithNoOrders = await prisma.customers.findMany({
                where: {
                    Orders: {
                        none: {}
                    }
                },
                include: {
                    Orders: true
                }
            })
            res.json(customersWithNoOrders);
        }
        catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Internal server error' });
        }
    } )

    /**
     * @swagger
     * /view_products_category:
     *   get:
     *     description: Categroy name beverages using a view
     *     responses:
     *       200:
     *         description: Success
     */
    app.get('/view_products_category', async (req, res) => {
        try {
            const productsWithCategory = await prisma.products_by_Category.findMany({
                where: {
                    CategoryName: 'Beverages'
                }
            })
            res.json(productsWithCategory);
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
    