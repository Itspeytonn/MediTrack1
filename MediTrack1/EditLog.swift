import SwiftUI
import SwiftData

struct EditLog: View {
  var log: Log
  @State private var newMedicationName: String
  @State private var newLogDate: Date
  @Environment(\.dismiss) private var dismiss // new
  init(log: Log) {
    self.log = log
      _newMedicationName = State(initialValue: log.medicationName)
      _newLogDate = State(initialValue: log.logDate)
  }
  var body: some View {
      Text("")
    Form { // new
        VStack(alignment: .leading, spacing: 8) {
            TextField("Name", text: $newMedicationName)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
            DatePicker("Log Date", selection: $newLogDate, displayedComponents: .date)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
        }
        //end vstack
        .listRowBackground(Color("lightPink"))
    }
    .background(Color.green)

    // end form
    .navigationTitle("Edit Log")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Cancel") {
          dismiss()
        }
        .foregroundColor(.red)
      }
      //.background(Color("darkPink"))
      ToolbarItem(placement: .confirmationAction) {
        Button("Save") { // new
            log.medicationName = newMedicationName
              log.logDate = newLogDate
          dismiss()
        }
        //end save button
      }//end action
    }
    //end toolbar
  }
  // end body
}
#Preview {
  NavigationStack { // new
      EditLog(log: Log(medicationName: "Test", logDate: Date.now))
  }
  //end nav stack
}
