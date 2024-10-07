import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReservaYaComponent } from './reserva-ya.component';

describe('ReservaYaComponent', () => {
  let component: ReservaYaComponent;
  let fixture: ComponentFixture<ReservaYaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReservaYaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ReservaYaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
