using System.Data;
using Dapper;
using Vacay.Model;
using Vacay.Models;

namespace Vacay.Repositories
{
    public class VacationsRepository
    {
        private readonly IDbConnection _db;
        public VacationsRepository(IDbConnection db)
        {
            _db = db;
        }
        internal Vacation   GetVacations(int id)
            {
                string sql = @"
                SELECT 
                v.*,
                t.*,
                c*,
                FROM vacations v
                JOIN  trip v ON vacation.id = trip.vacationId
                JOIN cruise c on trip.id = cruise.vacationId
                ";
                return _db.Query<Vacation, Cruise, Trip, Vacation>(sql, (v, t, c) => 
                {
                    v.CreatorId = c;
                    return c;
                }, new {id}).FirstOrDefault();
            }
    }
}