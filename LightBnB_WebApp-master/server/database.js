const properties = require('./json/properties.json');
const users = require('./json/users.json');

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

const getUserWithEmail = function(email) {
  return pool.query(`SELECT * FROM users where email = $1`, [email])
    .then((result) => {
      if (result.rows) {
        console.log("getUserWithEmail: ", result.rows[0]);
        return result.rows[0];
      } else {
        return null;
      }
    })
    .catch((err) => {
      console.log("getUserWithEmail: ", err.message);
    });
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool
    .query(`SELECT * FROM users where id = $1`, [id])
    .then((result) => {
      console.log("getUserWithId: ", result.rows[0])
      if (result.rows) {
        return result.rows[0];
      }
      return null;
    })
    .catch((err) => {
      console.log("getUserWithId: ", err.message);
    });
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function(user) {
  console.log(user)
  return pool.query(`INSERT INTO users (name, email, password) VALUES ($1,$2,$3) RETURNING *`, [user.name, user.email, user.password])
    .then((result) => {
      console.log("addUser: ", result.rows[0])
        return result.rows[0];
    })
    .catch((err) => {
      console.log("addUser err: ", err.message);
    });

}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {

  return pool.query(`
    SELECT *
    FROM reservations
    JOIN users on reservations.guest_id = users.id
    WHERE reservations.guest_id = $1
    LIMIT $2
   `, [guest_id,limit])
    .then((result) => {
      console.log("getAllReservations: ", result.rows[0])
      if (result.rows) {
        return result.rows[0];
      }
      return null;
    })
    .catch((err) => {
      console.log("getAllReservations: ", err.message);
    });
  // return getAllProperties(null, 2);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  return pool
    .query(`SELECT * FROM properties LIMIT $1`, [limit])
    .then((result) => {
      if (result.rows) {
        return result.rows[0];
      }
      return null;
    })
    .catch((err) => {
      console.log("getAllProperties: ", err.message);
    });
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
