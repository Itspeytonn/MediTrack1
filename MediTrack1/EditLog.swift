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
      ZStack {
          Color("lightBlue")
              .edgesIgnoringSafeArea(.all)
          
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
        .scrollContentBackground(.hidden)

        // end form
          
        .navigationTitle("Edit Log")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
        ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
                
              dismiss()
            }
            .bold()
            .foregroundColor(.black)
          }
          ToolbarItem(placement: .confirmationAction) {
            Button("Save") { // new
                log.medicationName = newMedicationName
                log.logDate = newLogDate
                dismiss()
            }
            .foregroundColor(.black)
            .bold()
            
            //end save button
          }//end action
        }
        //end toolbar
        .toolbarBackground(Color("theme"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        

      }
      // end zstack
          
      }
    //end body
      
}
//end struct
#Preview {
  NavigationStack { // new
      EditLog(log: Log(medicationName: "Test", logDate: Date.now))
  }
  //end nav stack
}
