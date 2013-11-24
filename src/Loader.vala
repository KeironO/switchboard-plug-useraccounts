//
//  Copyright (C) 2012-2013 Corentin Noël
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

public class Sample.Loader : Peas.ExtensionBase, Peas.Activatable {
    
    public GLib.Object object { owned get; construct; }
    Sample.Plug plug;
    
    public Loader () {
        GLib.Object ();
    }

    public void activate () {
        message ("Activating Sample plugin");
        plug = new Sample.Plug ();
        Switchboard.PlugsManager.get_default ().register_plug (plug);
    }

    public void deactivate () {
        message ("Deactivating Sample plugin");
    }

    public void update_state () {
        
    }
}

[ModuleInit]
public void peas_register_types (GLib.TypeModule module) {
    var objmodule = module as Peas.ObjectModule;
    objmodule.register_extension_type (typeof (Peas.Activatable),
                                     typeof (Sample.Loader));
}
