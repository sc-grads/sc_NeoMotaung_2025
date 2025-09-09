using Data;

namespace Application
{
    public class BookingService
    {
        public Entities Entities { get; set; }

        public BookingService(Entities entities)
        {

        }

        public void Book(BookDto bookDto)
        {
            var flight = Entities.Flights.Find(bookDto.FlightId);
            flight.Book(bookDto.PassengerEmail, bookDto.NumberOfSeats);
            Entities.SaveChanges();
        }

        public IEnumerable<BookingRm> FindBookings(Guid flightId)
        {
            //Looks for flight, find flight, goes to booking list , maps to booking rm
            return Entities.Flights.Find(flightId).BookingList.Select(b => new BookingRm(b.Email, b.NumberOfSeats));
        }
    }
}
