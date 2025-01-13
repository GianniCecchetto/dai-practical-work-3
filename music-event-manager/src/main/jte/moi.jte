@import ch.heigvd.dai.model.*
@param AllEvents allEvents

@for(Event event : allEvents.events)
    <li>${event.name()} ${event.a()}</li>
@endfor