class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select{|appt| appt.doctor == self}
    end

    def patients
        appointments.map{ |appt| appt.patient }
    end
end